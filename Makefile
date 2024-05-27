NAME = libft.a

GCC = gcc
CFLAGS = -Wall -Wextra -Werror
LIB = ar rcs
RM = rm -f

SRCS = ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_memchr.c ft_memcmp.c ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_strrchr.c ft_strnstr.c ft_strncmp.c ft_atoi.c ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c ft_toupper.c ft_tolower.c ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c
B_SRCS = ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c ft_lstlast_bonus.c ft_lstadd_back_bonus.c ft_lstdelone_bonus.c ft_lstclear_bonus.c ft_lstiter_bonus.c ft_lstmap_bonus.c

HEAD = libft.h
MAKE = Makefile

OBJS = $(SRCS:.c=.o)
B_OBJS = $(B_SRCS:.c=.o)
DEPS = $(SRCS:.c=.d) $(B_SRCS:.c=.d)

%.o: %.c
	$(GCC) $(CFLAGS) -c -MMD $<
	@touch bonus

$(NAME): $(OBJS) $(HEAD) $(MAKE)
	$(LIB) $(NAME) $(OBJS)

bonus: $(OBJS) $(B_OBJS)
	$(LIB) $(NAME) $(OBJS) $(B_OBJS)

all: $(NAME)

clean:
	$(RM) $(OBJS) $(B_OBJS) $(DEPS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

rebonus: fclean bonus

-include $(DEPS)

.PHONY: clean fclean re all bonus rebonus
