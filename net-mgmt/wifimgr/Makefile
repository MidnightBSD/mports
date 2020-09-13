# Created by: J.R. Oldroyd <fbsd@opal.com>

PORTNAME=	wifimgr
PORTVERSION=	1.12
CATEGORIES=	net-mgmt sysutils
MASTER_SITES=	http://opal.com/freebsd/ports/net-mgmt/wifimgr/ \
		FREEBSD_LOCAL/ehaupt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WiFi Networks Manager

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

USES=		desktop-file-utils pkgconfig tar:bzip2
USE_XORG=	x11
USE_GNOME=	gtk20
INSTALLS_ICONS=	yes

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext pkgconfig
NLS_CFLAGS_OFF=	-DWITHOUT_NLS
NLS_MAKE_ENV_OFF=	WITHOUT_NLS=yes

post-patch:
	@${REINPLACE_CMD} -e 's/-o root -g wheel//' ${WRKSRC}/src/Makefile

.include <bsd.port.mk>
