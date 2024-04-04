##
## EPITECH PROJECT, 2024
## B-CPE-210-PAR-2-1-stumper2-laurent.aliu
## File description:
## Makefile
##

SRC			=

SRC_MAIN 	=	src/main.c

SRC_TEST 	=

OBJ			=	$(SRC:.c=.o)

OBJ_MAIN	=	$(SRC_MAIN:.c=.o)

OBJ_TEST	=	$(SRC_TEST:.c=.o)

NAME		=	chococo

NAME_TEST	=	unit_tests

CFLAGS		=	-Wall -Wextra

CPPFLAGS	=	-iquote "include"

LDFLAGS		=

LDPATH		=

LDLIBS		=

CC			=	gcc

all: $(NAME)

$(NAME): $(OBJ) $(OBJ_MAIN)
	$(CC) -o $(NAME) $(OBJ_MAIN)

clean:
	$(RM) $(OBJ) $(OBJ_MAIN) $(OBJ_TEST)
	$(RM) *.gcno *.gcda

fclean: clean
	$(RM) $(NAME)
	$(RM) $(NAME_TEST)
	$(RM) *.gcda *.gcno vgcore.*

tests_run: LDFLAGS += --coverage -lcriterion
tests_run: fclean
	$(CC) -o $(NAME_TEST) $(SRC) $(SRC_TEST) $(LDLIBS) $(LDFLAGS)  $(CPPFLAGS)
	./$(NAME_TEST)

debug_asan: CFLAGS += -g3 -fsanitize=address
debug_asan: LDFLAGS += -fsanitize=address
debug_asan: fclean all

debug_valgrind: CFLAGS += -g3
debug_valgrind: fclean all

re: fclean all
