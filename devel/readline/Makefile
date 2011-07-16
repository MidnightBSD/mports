# $MidnightBSD: mports/devel/readline/Makefile,v 1.2 2010/06/04 23:12:29 laffer1 Exp $

PORTNAME=	readline
PORTVERSION=	6.2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU} \
		ftp://ftp.cwru.edu/pub/bash/
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for editing command lines as they are typed
LICENSE=	gpl3

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

INFO=		readline rluserman history
MAN3=		readline.3 history.3

.include <bsd.port.pre.mk>

.if ${ARCH} == "sparc64"
EXTRA_PATCHES+=	${FILESDIR}/support_shobj-conf.diff
.endif

pre-configure:
.if !defined(WITHOUT_TERMCAP)
	${REINPLACE_CMD} "s/SHOBJ_LDFLAGS =/SHOBJ_LDFLAGS = -ltermcap/" ${WRKSRC}/shlib/Makefile.in
.endif

.include <bsd.port.post.mk>
