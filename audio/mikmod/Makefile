# $MidnightBSD$
# $FreeBSD: ports/audio/mikmod/Makefile,v 1.29 2011/01/25 08:39:24 ehaupt Exp $

PORTNAME=	mikmod
PORTVERSION=	3.2.1
CATEGORIES=	audio
MASTER_SITES=	http://mikmod.raphnet.net/files/ \
		CRITICAL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mod player which plays MTM, STM, XM, MOD, S3M, ULT, UNI and IT mods
LICENSE=	gpl2

LIB_DEPENDS=	mikmod.2:${PORTSDIR}/audio/libmikmod

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes

.ifdef (WITH_COLOR)
CONFIGURE_ARGS+=	--enable-color-interface
.endif

MAN1=		mikmod.1
PLIST_FILES=	bin/mikmod

.include <bsd.port.mk>
