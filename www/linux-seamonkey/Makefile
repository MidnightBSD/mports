# $MidnightBSD$

PORTNAME=	seamonkey
DISTVERSION=	2.39
CATEGORIES=	www mail news editors irc ipv6
MASTER_SITES=	MOZILLA/${PORTNAME}/releases/${DISTVERSION}/linux-i686/en-US \
		https://ftp.mozilla.org/pub/mozilla.org/${PORTNAME}/candidates/${DISTVERSION}-candidates/build1/linux-i686/en-US/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The open source, standards compliant web browser

LICENSE=	mpl gpl2
LICENSE_COMB=	dual

USES+=		tar:bzip2

WANT_GTK218=	yes

.include "${.CURDIR}/Makefile.common"
.include <bsd.port.mk>
