# $MidnightBSD: mports/devel/m4/Makefile,v 1.7 2008/06/12 17:43:09 crash Exp $

PORTNAME=	m4
PORTVERSION=	1.4.12
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	m4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU m4
LICENSE=	gpl3

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--infodir=${PREFIX}/info --mandir=${PREFIX}/man \
		--program-prefix=g

.if defined(WITH_CHANGEWORD)
CONFIGURE_ARGS+=	--enable-changeword
.endif

INFO=	m4
MAN1=	gm4.1

EXAMPLESDIR=	share/examples/gm4

.include <bsd.port.pre.mk>

CONFIGURE_ENV+=	MAKEINFO="makeinfo --no-split"

post-install:
	@${MKDIR} ${PREFIX}/${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/*.m4 ${PREFIX}/${EXAMPLESDIR}

.include <bsd.port.post.mk>
