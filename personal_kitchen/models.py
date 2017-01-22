#!/usr/bin/env python
#-*-coding:utf-8-*-

import uuid
from django.db import models

# Create your models here.
class User(models.Model):
    db_table = 'user'
    uuid = models.AutoField(db_column='uuid', max_length=11, primary_key=True)
    name = models.CharField(db_column='name', max_length=20, blank=False)
    password = models.CharField(db_column='password', max_length=20, blank=False)
    email = models.EmailField(db_column='email', max_length=100, blank=True)
    create_time = models.DateTimeField(db_column='create_time', auto_now_add = True, blank=False)

class Menu(models.Model):
    db_table = 'menu'
    id = models.AutoField(db_column='id', max_length=11, primary_key=True)
    name = models.CharField(db_column='name', max_length=32, blank=False)
    uuid = models.CharField(db_column='uuid', max_length=11,blank=False)
    create_time = models.DateTimeField(db_column='create_time', auto_now_add=True, blank=False)

class Cookbook(models.Model):
    db_table = 'cookbook'
    id = models.AutoField(db_column='id', max_length=11, primary_key=True)
    title = models.CharField(db_column='title', max_length=255, blank=False)
    detail = models.TextField(db_column='detail', blank=True)
    uuid = models.CharField(db_column='uuid', max_length=11, blank=False)
    create_time = models.DateTimeField(db_column='create_time', auto_now_add=True, blank=False)
