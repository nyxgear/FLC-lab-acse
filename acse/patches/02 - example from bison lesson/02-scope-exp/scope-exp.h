#ifndef SCOPE_EXP
#define SCOPE_EXP

struct expr_t {
  int value;
  int poison;
};

struct expr_t get_value(const char *id);
void push_scope();
void pop_scope();
void decl_var(const char *id, int value);
void decl_var_input(const char *id);
void print_result(struct expr_t *e, int id);

#endif
