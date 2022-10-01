NAME = philo
CC = gcc
FLAG_WARN = -fsanitize=address -g3 #-Wall -Wextra -Werror #
FLAG_PTHREAD = -lpthread
SRC = main.c \
      util.c
OBJ = $(SRC:%.c=%.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(OBJ) $(FLAG_WARN) $(FLAG_PTHREAD) -o $(NAME)

%.o: %.c
	$(CC) $(FLAG_WARN) -c $< -o $@ 

clean:
	rm -f $(OBJ)

fclean: clean
	make clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re