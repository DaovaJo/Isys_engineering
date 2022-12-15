import sqlite3

class MatChange():
    def __init__(self):
        self.conNect = sqlite3.connect("ProjectDate.db")
        self.cur = self.conNect.cursor()
        self.inputer = str()

    def search_w(self):
        info = self.cur.execute('SELECT * FROM Dict WHERE мат=?', (self.word.upper(), ))
        if info.fetchone() is None:
            print(self.word, end = " ")
        else:
            info = self.cur.execute('SELECT замена FROM Dict WHERE мат = ?', (self.word.upper(), ))
            change = info.fetchone()
            # print(change)
            change = ''.join(change).replace('\n', ' ')
            print(change, end = " ")

    def changer(self):
        self.inputer = input('Введите сообщение   ')
        self.inputer = self.inputer.replace(',',' '); self.inputer = self.inputer.replace(':',' ');self.inputer = self.inputer.replace(';',' ');self.inputer = self.inputer.replace('.',' ');self.inputer = self.inputer.replace('-',' ');self.inputer = self.inputer.split(' ')

        for self.word in self.inputer:
            # print(self.word)
            self.search_w()




if __name__ == "__main__":
    matCh = MatChange()
    matCh.changer()
