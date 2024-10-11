# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mkerkeni <mkerkeni@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/28 17:53:41 by mkerkeni          #+#    #+#              #
#    Updated: 2024/10/11 21:07:00 by mkerkeni         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
H_FILE = ft_printf.h
LIBFT = Libft/
CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRCS = ft_printf.c ft_putnbr_unsigned_int.c print_str.c print_nbr.c ft_putnbr_hexa.c \
		print_hexa_low.c print_hexa_up.c \

OBJS = $(SRCS:.c=.o)

.c.o:
	$(CC) $(CFLAGS) -I . -c $< -o $(<:.c=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(MAKE) -C $(LIBFT)
	cp ./Libft/libft.a $(NAME)
	ar -rcs $@ $^

clean:
	rm -f $(OBJS)
	$(MAKE) clean -C $(LIBFT)

fclean: clean
	rm -f $(NAME)
	rm -f Libft/libft.a

re: fclean all

.PHONY: all clean fclean re
