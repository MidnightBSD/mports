# $MidnightBSD$
# $FreeBSD: ports/devel/devtodo/Makefile,v 1.18 2006/05/04 21:40:31 edwin Exp $

PORTNAME=	devtodo
PORTVERSION=	0.1.20
CATEGORIES=	devel
MASTER_SITES=	http://swapoff.org/files/devtodo/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to effectively maintain todo lists aimed at developers

LICENSE=	gpl2

CONFLICTS=	tdl-[0-9]* todo-[0-9]*

GNU_CONFIGURE=	yes
USES=		ncurses readline

OPTIONS_DEFINE=	EXAMPLES

# Note: without this define util/regex.c doesn't compile due to redeclaration
# of malloc and realloc functions. Adding this define was the simplest
# (although not elegant) solution.
CFLAGS+=	-DSTDC_HEADERS

post-patch:
	@${REINPLACE_CMD} -e 's/^\ttest -f.*todorc.*\n//' ${WRKSRC}/doc/Makefile.in

post-install:
	@${MKDIR} ${EXAMPLESDIR}
.for file in scripts.sh scripts.tcsh todorc.example
	${INSTALL_DATA} ${WRKSRC}/doc/${file} ${EXAMPLESDIR}
.endfor
	${INSTALL_DATA} ${WRKSRC}/doc/todorc.example ${PREFIX}/etc/todorc.sample

.include <bsd.port.mk>
