#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define TEXT_SIZE 28
#define LETTERS_SIZE 27

int getRandom();

void passString1ToString2();

float calcPercent();

/*
  Sorteia a primeira 'especie'.
*/
int randomParent();

/*
  Ve o quao perto esta o mutant do target, se for mais perto que
  o parent, troca de lugar com o parent.
  Retornos:
    1  -- identico ao esperado;
    2 -- mais proximo da resp;
    0  -- sem avanco.
*/
int fitness();

/*
  Sorteia mudancas no parent e retorna o mutante.
*/
void getMutate();

int main()
{
  srand(time(NULL));

  char target[TEXT_SIZE + 1] = "METHINKS IT IS LIKE A WEASEL";
  char charset[LETTERS_SIZE + 1] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ ";

  char parent[TEXT_SIZE + 1];
  char parentMatches[TEXT_SIZE + 1];
  int matches = 0;

  char mutate[TEXT_SIZE + 1];

  randomParent(parent, charset, parentMatches);
  int isEquals = fitness(parent, &matches, target, parent, parentMatches);

  printf("Texto alvo: %s\n", target);
  printf("Primeiro esp: %s\n", parent);
  int cont = 0;
  while (1)
  {
    cont += 1;
    getMutate(mutate, parent, parentMatches, charset);
    isEquals = fitness(mutate, &matches, target, parent, parentMatches);
    if (isEquals == 1)
    {
      //igual
      printf("tentativa %d: SUCESSO\n", cont);
      break;
    }
    else if (isEquals == 2)
    {
      //melhor que o pai
      printf("tentativa %d: %.2f%% \n", cont, calcPercent(matches, TEXT_SIZE));
    }
  }

  return 1;
}

int getRandom(int initValue, int endValue)
{
  return (rand() % endValue + initValue);
}

void passString1ToString2(char *s1, char *s2)
{
  for (int i = 0; i < TEXT_SIZE; i++)
  {
    s2[i] = s1[i];
  }
}

float calcPercent(int val, int max)
{
  return ((float)val / (float)max) * 100.0;
}

int randomParent(char *parent, char *charset, char *parentMatches)
{
  for (int i = 0; i < TEXT_SIZE; i++)
  {
    int randomValue = getRandom(0, LETTERS_SIZE);
    parent[i] = charset[randomValue];
    parentMatches[i] = 'f';
  }
  parent[TEXT_SIZE] = '\0';
  parentMatches[TEXT_SIZE] = '\0';
}

int fitness(char *mutant, int *matches, char *target, char *parent,
            char *parentMatches)
{
  char auxMatches[TEXT_SIZE + 1];
  int cont = 0;
  for (int i = 0; i < TEXT_SIZE; i++)
  {
    if (mutant[i] == target[i])
    {
      auxMatches[i] = 't';
      cont++;
    }
    else
    {
      auxMatches[i] = 'f';
    }
  }
  auxMatches[TEXT_SIZE] = '\0';

  if (cont == TEXT_SIZE)
  {
    passString1ToString2(auxMatches, parentMatches);
    return 1;
  }

  if (cont >= *matches)
  {
    passString1ToString2(mutant, parent);
    passString1ToString2(auxMatches, parentMatches);
    *matches = cont;
    return 2;
  }

  return 0;
}

void getMutate(char *mutate, char *parent, char *parentMatches, char *charset)
{
  // Sorteia mudancas no parent e retorna o mutante
  for (int i = 0; i < TEXT_SIZE; i++)
  {
    if (parentMatches[i] == 'f')
    {
      int randomValue = getRandom(0, LETTERS_SIZE);
      mutate[i] = charset[randomValue];
    }
    else
    {
      mutate[i] = parent[i];
    }
  }
  mutate[TEXT_SIZE] = '\0';
}