PORTNAME=	comserv
PORTVERSION=	1.4.4
CATEGORIES=	comms net
MASTER_SITES=	https://BSDforge.com/projects/source/comms/comserv/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provide network access to local serial ports and make remote ports appear local

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

USES=		tar:xz

PLIST_FILES=	sbin/comservd etc/comservd.conf.sample \
		etc/rc.d/comservd.sh.sample man/man8/comservd.8.gz

.include <bsd.port.mk>
