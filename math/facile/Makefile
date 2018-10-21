# $MidnightBSD$

PORTNAME=	facile
PORTVERSION=	1.1.3
CATEGORIES=	math
MASTER_SITES=	http://opti.recherche.enac.fr/facile/distrib/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Functional Constraint Library

LICENSE=	lgpl2.1

USE_OCAML=	yes
HAS_CONFIGURE=	yes
USES=		gmake
ALL_TARGET=	compile

post-configure:
	${REINPLACE_CMD} -e "s,make,${MAKE_CMD},; \
		s,cp,${INSTALL_DATA},;\
		s,mkdir,${MKDIR}," ${WRKSRC}/Makefile
	${REINPLACE_CMD} -e "s,${LOCALBASE},${FAKE_DESTDIR}${TRUE_PREFIX}," \
		${WRKSRC}/config_Makefile

.include <bsd.port.mk>
