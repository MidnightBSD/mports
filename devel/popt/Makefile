PORTNAME=	popt
PORTVERSION=	1.19
CATEGORIES=	devel
MASTER_SITES=	https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/ \
		http://ftp.rpm.org/popt/releases/popt-1.x/

MAINTAINER=	ports@MidnigghtBSD.org
COMMENT=	Getopt(3) like library with a number of enhancements, from Redhat
WWW=		https://github.com/rpm-software-management/popt

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

OPTIONS_DEFINE=	NLS

CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE} \
		--program-prefix=""
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
GNU_CONFIGURE=	yes
USES=		cpe libtool pathfix iconv
USE_LDCONFIG=	yes
CPE_VENDOR=	popt_project

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext-runtime localbase
OPTIONS_SUB=	yes

.include <bsd.port.mk>
