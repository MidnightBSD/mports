PORTNAME=	prometheus-collectd-exporter
PORTVERSION=	0.5.0
DISTVERSIONPREFIX=	v
CATEGORIES=	net-mgmt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collectd exporter for Prometheus

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go gmake
USE_GITHUB=	yes
GH_ACCOUNT=	prometheus
GH_PROJECT=	collectd_exporter

PLIST_FILES=	bin/prometheus-collectd-exporter

USE_RC_SUBR=	collectd_exporter

.include <bsd.port.mk>
