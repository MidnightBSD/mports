# $MidnightBSD$
# $FreeBSD: ports/misc/brs/Makefile,v 1.10 2005/10/20 20:13:42 vs Exp $

PORTNAME=	brs
PORTVERSION=	4.03
CATEGORIES=	misc
MASTER_SITES=	http://www.unknown.nu/ports/
DISTFILES=	bible.data.tar.bz2 bible.tar.bz2
DIST_SUBDIR=	brs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interactive King James Bible

LICENSE=	publicdom
# based on man page description

USES=		tar:bzip2
NO_WRKSUBDIR=	yes
ALL_TARGET=
CFLAGS+=	-Wno-error=return-type

.include <bsd.port.pre.mk>

post-patch:
	@${MV} ${WRKSRC}/brl.c ${WRKSRC}/brl.c.sed
	${SED} -e "s=%%PREFIX%%=${PREFIX}=g" \
		${WRKSRC}/brl.c.sed > ${WRKSRC}/brl.c
	@${MV} ${WRKSRC}/bible.1 ${WRKSRC}/bible.1.sed
	${SED} -e "s=%%PREFIX%%=${PREFIX}=g" \
		${WRKSRC}/bible.1.sed > ${WRKSRC}/bible.1

.include <bsd.port.post.mk>
