# $MidnightBSD$

PORTNAME=	libdnet
PORTVERSION=	1.12
PORTREVISION=	1
CATEGORIES?=	net
MASTER_SITES=	GOOGLE_CODE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple interface to low level networking routines

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	ac_cv_dnet_bsd_bpf=yes
USES+=		libtool tar:tgz

.if !defined(LIBDNET_SLAVE)
CONFIGURE_ARGS+=	--without-python
USE_LDCONFIG=	yes
.endif

post-patch:
	@${REINPLACE_CMD} 's|shrext|shrext_cmds|g' ${WRKSRC}/configure

.include <bsd.port.mk>
