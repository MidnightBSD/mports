PORTNAME=	Horde_Mail_Autoconfig
PORTVERSION=	1.0.3
CATEGORIES=	mail www pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Horde Mail Autoconfiguration
WWW=		https://pear.horde.org

LICENSE=	NONE

USES=	horde cpe
USE_HORDE_RUN=	Horde_Exception \
		Horde_Http \
		Horde_Imap_Client \
		Horde_Mail \
		Horde_Smtp

RUN_DEPENDS+=	${PEARDIR}/Net/DNS2.php:dns/pear-Net_DNS2@${PHP_FLAVOR}

.include <bsd.port.mk>
