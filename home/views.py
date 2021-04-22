from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.db import connection
import json
from django.contrib import messages

# Create your views here.


def home(request):
    return render(request, 'main/home.html')

def characters(request):
    characters = selectAllFrom("characters")                                        #fetch all characters from db
    return render(request, 'main/characters.html',{"characters": characters})       #render characters page and pass all the characters into it

def character(request, id):
    characterInfo = selectCharInfo(id)
    location = selectLocation(characterInfo[0][3])
    combos = selectCombos(id)
    print(combos)
    info = {
        "charInfo" : characterInfo[0],
        "locationInfo" : location[0][1],
        "combos" : combos,
    }
    return render(request, 'main/characterInfo.html',{"charInfo": info})

def arenas(request):
    arena= selectAllFrom("arenas")
    print(arena)
    return render(request, 'main/arenas.html', {"arena": arena})

def arena(request, id):

    info = {
        "arenaInfo" : selectArenaInfo(id)[0],
        "locationInfo": selectLocation(selectArenaInfo(id)[0][3])
    }
    return render(request, 'main/arenasInfo.html', {"arena": info})





                        # EDIT CHARACTER
def editCharacter(request, id):
    if request.user.is_authenticated:
        characterInfo = selectCharInfo(id)
        location = selectLocation(characterInfo[0][3])
        info = {
            "charInfo" : characterInfo[0],
            "locationInfo" : location[0][1],
            "location": selectAllLocation()
        }
        if request.method == 'POST':
            updateChar(request, id)
            return redirect('/characters/')
        else:
            return render(request, 'main/editCharacter.html', {"charInfo": info})
    else:
        return redirect('/characters/')



def updateChar(request, id):
    name = request.POST["name"]
    text = request.POST["text"]
    locationId = selectLocationId(request.POST["location"])
    image = request.POST["image"]
    
    with connection.cursor() as cursor:
        cursor.execute("UPDATE characters SET CHARACTER_NAME = '" + str(name) + 
        "', LOCATION_ID = '" + str(locationId[0]) + "', CHARACTER_DESCRIPTION = '" + str(text) +
        "', CHARACTER_PICTURE = '" + str(image) + "' where CHARACTER_ID = " + id + ";")
    

#                           END EDIT CHARACTER

#####################START EDIT ARENA ###########################
def editArena(request, id):
    if request.user.is_authenticated:
        arenaInfo = selectArenaInfo(id)
        location = selectLocation(arenaInfo[0][3])
        info = {
            "arenaInfo": arenaInfo[0],
            "locationInfo": location [0][1],
            "location": selectAllLocation(),
        }
        if request.method == 'POST':
            updateArena(request, id)
            return redirect('/arenas/')
        else:
            return render(request, 'main/editArena.html', {"arenaInfo": info})
    else:
        return redirect('/arenas/')



def updateArena(request, id):
    name = request.POST["name"]
    text = request.POST["text"]
    locationID = selectLocationId(request.POST['location'])
    image= request.POST["image"]
    with connection.cursor() as cursor:
        cursor.execute("UPDATE arenas SET arena_name = '" + str(name) + 
        "', LOCATION_ID = '" + str(locationID[0]) + "', ARENA_DESCRIPTION = '" + str(text) +
        "', ARENA_PICTURE = '" + str(image) + "' where ARENA_ID = " + id + ";")


#####################END EDIT ARENA ###########################

#                           ADD CHARACTER
def addCharacter(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            if insertChar(request):
                return redirect('/characters/')
            else:
                messages.error(request, "Character name already exists! Add a different character.")
                return redirect('/characters/add/')
        else: 
            return render(request, 'main/addCharacter.html', {"locations": selectAllLocation()})
    else:
        return redirect('/characters/')





def addArena(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            if insertArena(request):
                return redirect('/arenas/')
            else:
                messages.error(request, "Arena already exists!")
                return redirect('/arenas/add/')
        else:
            return render(request, 'main/addArena.html', {"locations": selectAllLocation()})
    else:
        return redirect('/arenas/')





def addCombo(request, id):
    if request.user.is_authenticated:
        if request.method =='POST':
            if insertCombo(request, id):
                return redirect('/characters/' + str(id))
            else:
                messages.error(request, "Combo already exists!")
                return redirect('/characters/' + str(id) +"/addCombo")
        else:
            return render(request, 'main/addCombo.html')
    else:
        return redirect('/characters/' + str(id))
                

    

def editCombo(request, charID, comboID):
    if request.user.is_authenticated:
        combo = selectCombo(charID, comboID)[0]
        if request.method == 'POST':
            updateCombo(request, comboID)
            return redirect('/characters/'+ str(charID) )
        else:
            return render(request, 'main/editCombo.html', {"combo": combo})
    else:
        return redirect('/character')
    


def updateCombo(request, id):
    name = request.POST["name"]
    moveType = request.POST["type"]
    PS = request.POST["PS"]
    XBOX = request.POST["XBOX"]
    with connection.cursor() as cursor:
        cursor.execute("UPDATE moves SET moves_name = '" + name + "', move_type = '" + moveType + "' where MOVE_ID = " + id + ";")
        cursor.execute("UPDATE combo set combo_move = '"+ PS + "' where platform_id = 1 and move_id = " + id + ";")
        cursor.execute("UPDATE combo set combo_move = '"+ XBOX + "' where platform_id = 2 and move_id = " + id + ";")






def insertCombo(request, id):
    charId = id
    moveId = getMoveId()
    name = request.POST["name"]
    moveType = request.POST["type"]
    controlsPS = request.POST["PS"]
    controlsXBOX = request.POST["XBOX"]
    if isMoveUnique(name):
        return False
    else:
        with connection.cursor() as cursor:
            cursor.execute("insert into moves (MOVE_ID, CHARACTER_ID, MOVE_TYPE, MOVES_NAME) values ("+
            str(moveId) + ", '"+ str(charId) +"', '"+ moveType + "', '"+ name +"');" )
            cursor.execute("insert into combo (PLATFORM_ID, MOVE_ID, COMBO_MOVE) values (1," + str(moveId) +",'" + controlsPS + "'), (2," + str(moveId) +",'" + controlsXBOX + "');")
        return True


def deleteCombo(request, charID, comboID):
    if request.user.is_authenticated:
        with connection.cursor() as cursor:
            cursor.execute("delete from combo where move_id = " + str(comboID) + ";")
            cursor.execute("delete from moves where move_id = " + str(comboID) + ";")
    return redirect('/characters/'+ str(charID))


def insertArena(request):
    id = getArenaId()
    name = request.POST["name"]
    text = request.POST["text"]
    locationId = selectLocationId(request.POST["location"])
    image = request.POST["image"]
    if isArenaUnique(name):
        return False
    else:
        with connection.cursor() as cursor:
            cursor.execute("insert into arenas (ARENA_ID, ARENA_NAME, ARENA_PICTURE, LOCATION_ID, ARENA_DESCRIPTION) values ("+
            str(id) + ", '"+ name +"', '"+ image+ "', '"+ str(locationId[0]) + "', '"+   text+"');")
        return True



def insertChar(request):
    id = getCharId()
    name = request.POST["name"]
    text = request.POST["text"]
    locationId = selectLocationId(request.POST["location"])
    image = request.POST["image"]
    if isCharUnique(name):
        return False
    else:
        with connection.cursor() as cursor:
            cursor.execute("insert into characters (CHARACTER_ID, CHARACTER_NAME, GAME_ID, LOCATION_ID, CHARACTER_DESCRIPTION, CHARACTER_PICTURE) values ("+
            str(id) + ", '"+ name +"', "+ "1, "+ str(locationId[0]) + ", '"+ text + "', '"+ image +"');")
        return True
    


def getMoveId():
    with connection.cursor() as cursor:
        cursor.execute("SELECT MAX(MOVE_ID) from moves;")
        row = cursor.fetchone()
        if row[0] == None:
            return 1
    return int(row[0]) + 1



def getArenaId():
    with connection.cursor() as cursor:
        cursor.execute("SELECT MAX(ARENA_ID) from arenas;")
        row = cursor.fetchone()
    return row[0] + 1



def getCharId():
    with connection.cursor() as cursor:
        cursor.execute("SELECT MAX(CHARACTER_ID) from characters;")
        row = cursor.fetchone()
    return row[0] + 1



def isArenaUnique(name):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM arenas where arena_name = '" +name+ "';")
        row = cursor.fetchall()
    return row



def isMoveUnique(name):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM moves where moves_name = '" +name+ "';")
        row = cursor.fetchall()
    return row



def isCharUnique(name):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM characters where character_name = '" +name+ "';")
        row = cursor.fetchall()
    return row

#                       END ADD CHARACTER



#                       DELETE CHARACTER
def deleteCharacter(request, id):
    if request.user.is_authenticated:
        with connection.cursor() as cursor:
            cursor.execute("delete from characters where character_id = " + str(id) + ";")
    return redirect('/characters/')
#                       END DELETE CHARACTER



def deleteArena(request, id):
    if request.user.is_authenticated:
        with connection.cursor() as cursor:
            cursor.execute("delete from arenas where arena_id = " + str(id) + ";")
    return redirect("/arenas/")



#select all from table
def selectAllFrom(table):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM "+ table +";")
        row = cursor.fetchall()
    return row



def selectLocation(locationId):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM location where location_id ="+ str(locationId)  +";")
        row = cursor.fetchall()
    return row



def selectLocationId(locationName):
    with connection.cursor() as cursor:
        cursor.execute("SELECT location_id FROM location where LOCATION_NAME = '"+ locationName  +"';")
        row = cursor.fetchone()
    return row



def selectAllLocation():
    with connection.cursor() as cursor:
        cursor.execute("SELECT LOCATION_NAME FROM location;")
        row = cursor.fetchall()
    return row



def selectCharInfo(charId):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM characters where character_id ="+ charId  +";")
        row = cursor.fetchall()
    return row



def selectArenaInfo(arenaId):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM arenas where arena_id ="+ arenaId  +";")
        row = cursor.fetchall()
    return row

def selectCombos(charID):
    with connection.cursor() as cursor:
        cursor.execute("SELECT combo.MOVE_ID, moves.moves_name, moves.move_type, max(case when platform_id = 1 then COMBO_MOVE end) ps, max(case when platform_id = 2  then COMBO_MOVE end) xbox from moves inner join combo on moves.move_ID = combo.move_id and character_id = " + str(charID) + " group by move_id;")
        row = cursor.fetchall()
    return row

def selectCombo(charID, comboID):
    with connection.cursor() as cursor:
        cursor.execute("SELECT combo.MOVE_ID, moves.moves_name, moves.move_type, max(case when platform_id = 1 then COMBO_MOVE end) ps, max(case when platform_id = 2  then COMBO_MOVE end) xbox from moves inner join combo on moves.move_ID = combo.move_id and character_id = " + str(charID) + " and combo.move_id = " + str(comboID)+";")
        row = cursor.fetchall()
    return row
