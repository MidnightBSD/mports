PORTNAME=	edyvalue
PORTVERSION=	2007.01.06
PORTREVISION=	1
CATEGORIES=	japanese
MASTER_SITES=	http://www.imfj.net/people/nomura/soft/PaSoRi/
DISTNAME=	EdyValue
DIST_SUBDIR=	${PORTNAME}/${PORTVERSION}
EXTRACT_SUFX=	.c
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to print a statement of Edy card
WWW=		https://www.imfj.net/people/nomura/soft/PaSoRi/EdyValue.html

LICENSE=	NONE

LIB_DEPENDS=	libpasori.so:devel/libpasori

USES=		uidfix
MAKEFILE=	${FILESDIR}/Makefile

PLIST_FILES=	bin/EdyValue

post-extract:
	@${MKDIR} ${WRKSRC}
	@${CP} -f ${DISTDIR}/${DIST_SUBDIR}/${DISTFILES} ${WRKSRC}

.include <bsd.port.mk>
