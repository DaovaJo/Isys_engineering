import sqlite3
from encodings import utf_8

class ReadDict():
    def __init__(self):
        self.mat = ''
        self.change = ''
        self.conNect = sqlite3.connect("ProjectDate.db")
        self.cur = self.conNect.cursor()

    def editDB(self):
        try:
            # self.cur.execute("INSERT INTO Dict VALUES (?, ?)", (self.mat, self.change))
            # self.conNect.commit()

            # info = self.cur.execute('SELECT * FROM Dict WHERE замена=?', (self.change, )).fetchone()
            # print(info)
            info = self.cur.execute('SELECT * FROM Dict WHERE мат=?', (self.mat, ))
            if info.fetchone() is None:  
                self.cur.execute("INSERT INTO Dict VALUES (?, ?)", (self.mat, self.change))
                self.conNect.commit()
                print(self.mat + '---------------' + self.change)
            else:
            # self.cur.execute("INSERT * FROM Dict WHERE замена=?", (self.change))
                self.cur.execute("Update Dict set замена = ? where мат = ?", (self.change, self.mat))
                self.conNect.commit()
                print("мияу")
            
        except:
            self.cur.execute("CREATE TABLE Dict(мат, замена)")


    def read_dict(self):
        file = open('anti mat/bd/словарный запас.txt', encoding="utf-8")
        for line in file:
            line = line.split("-")
            self.mat = line[0]
            self.change = line[1]
            self.editDB()



if __name__ == "__main__":
    rd = ReadDict()
    print(rd.read_dict())




