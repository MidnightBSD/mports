# $MidnightBSD$
# $FreeBSD: ports/textproc/tidyp/Makefile,v 1.1 2010/05/16 09:23:35 miwi Exp $

PORTNAME=	tidyp
PORTVERSION=	1.04
CATEGORIES=	textproc www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and program to validate and fix HTML

LICENSE=	unknown

CONFIGURE_ARGS=	--enable-asian --enable-utf16
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USES=		autoreconf libtool

GH_ACCOUNT=	petdance
USE_GITHUB=	yes

OPTIONS_DEFINE=	ACCESS DEBUG
ACCESS_DESC=	Accessibility checks

PLIST_SUB=	PORTVERSION=${PORTVERSION}

ACCESS_CONFIGURE_ENABLE=access
DEBUG_CONFIGURE_ENABLE=	debug

.include <bsd.port.mk>
