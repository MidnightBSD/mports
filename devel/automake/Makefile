PORTNAME=	automake
PORTVERSION=	1.16.5
CATEGORIES=	devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Standards-compliant Makefile generator
WWW=		https://www.gnu.org/software/automake/

LICENSE=	gpl2+ gfdl
LICENSE_COMB=	multi

BUILD_DEPENDS=	autoconf>=2.69:devel/autoconf
RUN_DEPENDS=	autoconf>=2.69:devel/autoconf

BUILD_VERSION=	1.16
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
USES=		cpe makeinfo perl5 tar:xz
GNU_CONFIGURE=	yes
MAKE_ENV+=	MAKEINFOFLAGS=--no-split
INFO=		automake automake-history
CPE_VENDOR=	gnu

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
