# $MidnightBSD$

PORTNAME=	faac
PORTVERSION=	1.28
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-src/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPEG-2 and MPEG-4 AAC audio encoder

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libmp4v2.so:${PORTSDIR}/multimedia/mp4v2

RESTRICTED=	Distribution in binary form is prohibited

USES=		autoreconf dos2unix gmake libtool tar:bzip2
USE_AUTOTOOLS=	libtoolize
INSTALL_TARGET=	install-strip
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-mp4v2
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

post-patch:
	@${ECHO_CMD} "" >> ${WRKSRC}/libfaac/psych.h
	@${REINPLACE_CMD} -e 's|<mp4\.h>|<mp4v2/mp4v2.h>|g' \
		${WRKSRC}/frontend/main.c \

.include <bsd.port.post.mk>
