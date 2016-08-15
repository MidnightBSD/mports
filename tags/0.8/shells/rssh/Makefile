# $MidnightBSD$

PORTNAME=	rssh
PORTVERSION=	2.3.4
CATEGORIES=	shells security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Restricted Secure SHell only for sftp or/and scp

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

GNU_CONFIGURE=	yes

USE_CSTD=	gnu89
OPTIONS_DEFINE=	RDIST RSYNC3
RDIST_DESC=	rdist support
RDIST_RUN_DEPENDS=	rdist6:${PORTSDIR}/net/rdist6
RDIST_CONFIGURE_ON=	--with-rdist=${LOCALBASE}/bin/rdist6

RSYNC3_DESC=		rsync3 support (Debian patch)
RSYNC3_EXTRA_PATCHES=	${FILESDIR}/optional-patch-util.c

.include <bsd.port.mk>
