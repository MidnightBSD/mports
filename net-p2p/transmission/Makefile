PORTNAME=	transmission
DISTVERSION=	3.00
PORTREVISION=	2
CATEGORIES=	net-p2p
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Meta-port for Transmission BitTorrent client

LICENSE=	gpl2 mit
LICENSE_COMB=	multi

OPTIONS_DEFINE=		CLI DAEMON GTK QT UTILS WEB
OPTIONS_DEFAULT=	${OPTIONS_DEFINE}

CLI_DESC=		Command line version
DAEMON_DESC=		Daemon version
GTK_DESC=		GTK version
QT_DESC=		Qt version
UTILS_DESC=		Command line tools
WEB_DESC=		Web client

CLI_RUN_DEPENDS=	transmission-cli:net-p2p/transmission-cli
DAEMON_RUN_DEPENDS=	transmission-daemon:net-p2p/transmission-daemon
GTK_RUN_DEPENDS=	transmission-gtk:net-p2p/transmission-gtk
QT_RUN_DEPENDS=		transmission-qt:net-p2p/transmission-qt
UTILS_RUN_DEPENDS=	transmission-create:net-p2p/transmission-utils
WEB_RUN_DEPENDS=	${DATADIR}/web/index.html:www/transmission-web

NO_BUILD=     yes

do-install:
	@${DO_NADA}


.include <bsd.port.mk>
