# $MidnightBSD$
# $FreeBSD: ports/devel/chrpath/Makefile,v 1.4 2010/09/20 17:55:49 rene Exp $

PORTNAME=	chrpath
PORTVERSION=	0.13
CATEGORIES=	devel sysutils
MASTER_SITES=	http://ftp.tux.org/pub/X-Windows/ftp.hungry.com/chrpath/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to modify DT_RPATH in existing ELF binaries
LICENSE=	gpl2

GNU_CONFIGURE=	yes

MAN1=		chrpath.1

PLIST_FILES=	bin/chrpath

PORTDOCS=	AUTHORS ChangeLog NEWS README

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.	for i in ${PORTDOCS}
		${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.	endfor
.endif

.include <bsd.port.mk>
