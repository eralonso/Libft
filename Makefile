# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eralonso <eralonso@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/18 12:39:13 by eralonso          #+#    #+#              #
#    Updated: 2022/10/13 09:32:37 by eralonso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#----------------------------------->COLORS<-----------------------------------#
DEF_COLOR = \033[0;39m
WHITE = \033[1m
BLACK = \033[0;30m
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
PINK = \033[0;35m
CIAN = \033[0;36m

#------------------------------------>NAME<------------------------------------#
NAME = libft.a

#----------------------------------->HEADER<-----------------------------------#
HEADER = libft.h

#------------------------------------>BNAME<-----------------------------------#
BNAME = .bonus_name

#------------------------------------->SRC<----–-------------------------------#
SRCS = ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c \
	   ft_memchr.c	ft_memcmp.c	ft_strlen.c ft_isalpha.c \
	   ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
	   ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c \
	   ft_strncmp.c ft_strlcpy.c ft_strlcat.c ft_strnstr.c \
	   ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c \
	   ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c \
	   ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c \
	   ft_putendl_fd.c ft_putnbr_fd.c
BONUS_SRCS = ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c \
			 ft_lstlast_bonus.c ft_lstadd_back_bonus.c ft_lstclear_bonus.c \
			 ft_lstdelone_bonus.c ft_lstiter_bonus.c ft_lstmap_bonus.c

#------------------------------------>DIR<-------------------------------------#
OBJS_DIR = $(shell pwd)/objs/

#------------------------------------>OBJ<-------------------------------------#
OBJS = $(addprefix ${OBJS_DIR}, ${SRCS:.c=.o})
BONUS_OBJS = $(addprefix ${OBJS_DIR}, ${BONUS_SRCS:.c=.o})

DEP = $(addsuffix .d, $(basename ${OBJS}))
BDEP = $(addsuffix .d, $(basename ${BONUS_OBJS}))

#----------------------------------->COMANDS<----------------------------------#
CFLAGS = -Wall -Wextra -Werror
RM = rm -f
MDP = mkdir -p
AR = ar crs
INCLUDE = -I ./

#------------------------------------>RULES<-----------------------------------#
${OBJS_DIR}%.o: %.c Makefile
	@${MDP} $(dir $@)
	@echo "${PINK}Compiling: ${YELLOW}$<... ${DEF_COLOR}"
	@gcc -MT $@ ${CFLAGS} -MMD -MP ${INCLUDE} -c $< -o $@

all: ${NAME}

${NAME}: ${OBJS}
	@${AR} ${NAME} ${OBJS}
	@echo "${GREEN}Library has been created.${DEF_COLOR}"

-include ${DEP}

bonus: ${BNAME}

${BNAME}: ${OBJS} ${BONUS_OBJS} 
	@${AR} ${NAME} ${OBJS} ${BONUS_OBJS}
	@echo "${GREEN}Bonus library has been created.${DEF_COLOR}"
	@touch $@

-include ${BDEP}

clean:
	@${RM} -r ${OBJS_DIR} ${BONUS_OBJS_DIR}
	@echo "${RED}All objects and dependences are removed.${DEF_COLOR}"

fclean: clean
	@${RM} ${NAME} ${BNAME}
	@echo "${RED}Library are removed.${DEF_COLOR}"

re: fclean all
	@echo "${CIAN}Library have been remake"

.PHONY: all bonus clean fclean re
