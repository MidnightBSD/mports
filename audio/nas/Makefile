# New ports collection makefile for:	nas (formerly netaudio)
# Date created:		03 Nov 1994
# Whom:			jkh
#
# $FreeBSD: ports/audio/nas/Makefile,v 1.39 2006/06/09 18:59:19 ahze Exp $
# $MidnightBSD: mports/audio/nas/Makefile,v 1.2 2007/04/13 06:32:02 ctriv Exp $
#

PORTNAME=	nas
PORTVERSION=	1.8
CATEGORIES=	audio
MASTER_SITES=	http://nas.codebrilliance.com/nas/
EXTRACT_SUFX=	.src.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Network Audio System

CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_IMAKE=	yes
USE_XLIB=	yes
USE_X_PREFIX= 	yes
USE_LDCONFIG=	yes
MAKE_ENV+=	COMPRESS_CMD="${COMPRESS_CMD:S/c//}"
PKGMESSAGE=	${WRKDIR}/pkg-message
SUB_FILES=	pkg-message

.include <bsd.port.pre.mk>
post-patch:
	@${FIND} ${WRKSRC} -name '*.c' | ${XARGS} ${GREP} -lF malloc.h \
		| ${XARGS} ${REINPLACE_CMD} -n -e "s|<malloc.h>||" -e t -e p

post-configure:
	# Work around shortcomings of the Image.rules et. al:
	${REINPLACE_CMD} -e 's:-fPIC:${FPIC} -DPIC:g' \
	    -e 's,-c \$$(CCOPTIONS),-c $$(CFLAGS),' \
	    -e 's,\(\$$(AR) \$$@ \$$\)(OBJS),\1(OBJS:S|^|unshared/|),' \
		${WRKSRC}/lib/audio/Makefile

.include "Makefile.man"

.if ${ARCH} == "sparc64"
FPIC=	-fPIC
.else
FPIC=	-fpic
.endif

.include <bsd.port.post.mk>
