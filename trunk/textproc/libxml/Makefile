# $MidnightBSD$

PORTNAME=	libxml
PORTVERSION=	1.8.17
PORTREVISION=	7
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML parser library for GNOME
LICENSE=	gpl2

DEPRECATED=   Last release in 2002, unsupported by developers

USES=	libtool gmake pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_UNSAFE=	yes

pre-patch:
	@${FIND} ${WRKSRC} -name "*.[ch]" | ${XARGS} ${REINPLACE_CMD} -e \
		's|malloc\.h|stdlib.h|g'

.include <bsd.port.mk>
