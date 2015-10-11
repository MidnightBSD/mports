# $MidnightBSD$
# $FreeBSD: head/net-im/linux-instantbird/Makefile 367712 2014-09-09 06:16:35Z bapt $

PORTNAME=	instantbird
DISTVERSION=	1.5
DISTVERSIONSUFFIX=.${LOCALE}.linux-i686
CATEGORIES=	net-im irc ipv6
MASTER_SITES=	http://ftp.instantbird.com/instantbird/releases/${DISTVERSION}/ \
		GOOGLE_CODE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Instant Messaging client based on XULRunner and libpurple

#probably gpl2
LICENSE=	unknown

USES=		tar:bzip2
USE_LINUX_APPS=	libxml2 #avahiglib avahilibs

ALL_LOCALES=	cs de en-US es-ES et fr nl pl pt-BR ru sk sv-SE uk
LOCALE=		${${PORT_OPTIONS:MLANG_*}}
PLIST_SUB=	LOCALE="${LOCALE}"
EXTRACT_AFTER_ARGS=--exclude '*/searchplugins'

OPTIONS_DEFAULT=LANG_US
OPTIONS_SINGLE=	L10N

L10N_DESC?= 	Localization

.for l in ${ALL_LOCALES}
OPTIONS_SINGLE_L10N+=LANG_${l:tu:C/.*-//}
LANG_${l:tu:C/.*-//}= ${l}
. if defined(PACKAGE_BUILDING)
DISTFILES+=	${DISTNAME:S/${LOCALE}/${l}/}${EXTRACT_SUFX}
. endif
.endfor

.include "${.CURDIR}/../../www/linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
