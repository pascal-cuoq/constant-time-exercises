
/* Question 1: what inputs does this function's execution time reveal
   information about? */

int identical_memory(char *p, char *q, unsigned long len) {
  unsigned long i;
  for (i=0; i<len; i++)
    if (p[i] != q[i]) return 0;
  return 1;
}

/* Question 2: improve? */

