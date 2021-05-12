from random import randrange

class evolution():

    def __init__(self):
        self.target = list('METHINKS IT IS LIKE A WEASEL')
        self.charset = list('ABCDEFGHIJKLMNOPQRSTUVWXYZ ')

        self.parent = []
        self.parentMatches = []
        self.matches = 0

    def randomParent(self):
        # Sorteia a primeira 'especie'
        for i in range(len(self.target)):
            randomValue = randrange(len(self.charset))
            self.parent.append(self.charset[randomValue])
            self.parentMatches.append(False)
        
    def fitness(self, mutant):
        # Ve o quao perto esta o mutant do target, se for mais perto que
        # o parent, troca de lugar com o parent.
        # Retornos:
        #   True  -- identico ao esperado;
        #   False -- mais proximo da resp;
        #   None  -- sem avanco.
        auxMatches = []
        cont = 0
        for i in range(len(self.target)):
            if mutant[i] == self.target[i]:
                auxMatches.append(True)
                cont += 1
            else:
                auxMatches.append(False)

        if (cont == len(self.target)):
            return True

        if (cont >= self.matches):
            self.parent = mutant
            self.parentMatches = auxMatches
            self.matches = cont
            return False
        
        return None

    def mutate(self):
        # Sorteia mudancas no parent e retorna o mutante
        mutate = []
        for i in range(len(self.parent)):
            if not self.parentMatches[i]:
                randomValue = randrange(len(self.charset))
                mutate.append(self.charset[randomValue])
            else:
                mutate.append(self.parent[i])
        
        return mutate

    def builder(self):
        print('Texto alvo: {0}'.format(self.__passListToString(self.target)))

        # Define a primeira especie
        self.randomParent()
        self.fitness(self.parent)
        print('Primeira esp: {0}'.format(self.__passListToString(self.parent)))
    
        cont = 0
        while True:
            cont += 1
            mutant = self.mutate()
            isEquals = self.fitness(mutant)
            if isEquals == None:
                #mutante sem resultados
                pass
            elif isEquals:
                #igual
                print('tentativa {0}: SUCESSO'.format(cont))
                break
            elif not isEquals:
                #melhor que o pai
                percent = self.__calcPercent()
                print('tentativa {0}: {1:.2f}%'.format(cont, percent))

    def __passListToString(self, list):
        return ''.join(map(str, list))
    
    def __calcPercent(self):
        return (self.matches / 28) * 100

e= evolution()
e.builder()