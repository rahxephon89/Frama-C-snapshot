/* Generated by Frama-C */
#include "stdio.h"
#include "stdlib.h"
int main(void)
{
  int __retres;
  __e_acsl_memory_init((int *)0,(char ***)0,(size_t)8);
  int x = 0;
  /*@ assert x ≡ 0; */
  __e_acsl_assert(x == 0,(char *)"Assertion",(char *)"main",(char *)"x == 0",
                  6);
  if (x) 
    /*@ assert x ≢ 0; */
    __e_acsl_assert(x != 0,(char *)"Assertion",(char *)"main",
                    (char *)"x != 0",7);
  __retres = 0;
  return __retres;
}

