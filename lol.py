#!/usr/bin/python
# Project - contact database with Python
# Version 0.3
# Use :%s/echo/print/ to replace def with def for all line in vi
# reset # clear screen
import os.path
import sys


# show menue function
def print_menu():
    print("1. Search")
    print("2. Add")
    print("3. Delete")
    print("4. Modify")
    print("5. Exit")


# seach function
def search_record():
    print("We will search later on")


# add record to file
def add_to_file(name, species, origin):
    if not os.path.isfile("contact_database_python.dat"):
        print("Cannot Open File:")  # conveys error message
        sys.exit()

    rcd = name + " " + species + " " + origin
    filehandle_w = open("contact_database_python.dat", "a")
    filehandle_w.write("\n")
    filehandle_w.write(rcd)
    filehandle_w.close()


# show records
def show_record():
    if not os.path.isfile("contact_database_python.dat"):
        print("Cannot open file:")  # conveys error message
        sys.exit()

    filehandle_r = open("contact_database_python.dat", "r")
    for line in filehandle_r:
        print(line, end="")
    print("")
    filehandle_r.close()


# add function
def add_record():
    name = input("please enter name of Champion -> ")
    while name.isnumeric():  # check if number
        name = input("please enter name of Champion -> ")

    species = input("please enter species -> ")
    while species.isnumeric():  # check if number
        species = input("please enter species -> ")

    origin = input("please enter origin -> ")
    while origin.isnumeric():  # check if number
        origin = input("please enter origin -> ")

    add_to_file(name, species, origin)
    print("record added! displaying records: ")
    show_record()


# delete function
def delete_record():
    print("We will delete later")


# modify function
def modify_record():
    print("We will modify later")


# program begins here
print("Welcome to contact app v0....")
print("Please make a choice from the following menue!")
print_menu()  # call show meneu function
choice = eval(input("Enter a choice number: "))  # read choice

while choice != 5:  # loop as long as choice is not equal to 5
    if choice == 1:
        search_record()
    elif choice == 2:
        add_record()
    elif choice == 3:
        delete_record()
    elif choice == 4:
        modify_record()
    else:
        sys.exit("Wrong choice exiting......")

    choice = int(input("what else would you like to do, make a choice -> "))
