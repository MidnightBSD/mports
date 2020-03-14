# Created by: Corey Smith <corsmith@gmail.com>

PORTNAME=	zerotier
DISTVERSION=	1.4.6
CATEGORIES=	net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Network virtualization everywhere

LICENSE=		BUSINESS mit publicdom
LICENSE_COMB=		multi
LICENSE_NAME_BUSINESS=	Business Source License
LICENSE_FILE_BUSINESS=	${WRKSRC}/LICENSE.txt
LICENSE_FILE_mit=	${WRKSRC}/ext/json/LICENSE.MIT
LICENSE_PERMS_BUSINESS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		gmake compiler:c++14-lang
USE_RC_SUBR=	zerotier

USE_GITHUB=	yes
GH_PROJECT=	ZeroTierOne

CFLAGS+=	-flax-vector-conversions

OPTIONS_DEFINE=	DBG
DBG_DESC=	Enable foreground debugging for zerotier-one daemon
DBG_ALL_TARGET=	debug

PLIST_FILES=	bin/zerotier-cli bin/zerotier-idtool sbin/zerotier-one

LEGAL_TEXT=	No SaaS or Govt usage: https://github.com/zerotier/ZeroTierOne/blob/master/LICENSE.txt

.include <bsd.port.pre.mk>

SUB_LIST+=	ZEROTIER_SYSLOG="-s debug -T zerotier"
SUB_LIST+=	ZEROTIER_IF_TAP="if_tap"

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/zerotier-one ${STAGEDIR}${PREFIX}/sbin/
.for l in zerotier-cli zerotier-idtool
	${RLN} ${STAGEDIR}${PREFIX}/sbin/zerotier-one ${STAGEDIR}${PREFIX}/bin/${l}
.endfor

.include <bsd.port.post.mk>
