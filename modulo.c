#include "__fc_builtin.h"

/* Question 1: what inputs does this function's execution time reveal
   information about? */

unsigned modulo(unsigned a, unsigned b) {
  return a % b;
}

int main(void) {
  modulo(Frama_C_interval(0, 0x7fffffff), Frama_C_interval(1, 0x7fffffff));
}
