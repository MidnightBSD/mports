PORTNAME=	popt
PORTVERSION=	1.16
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES= http://ftp.rpm.org/mirror/popt/ \
		GENTOO 

MAINTAINER=	ports@MidnigghtBSD.org
COMMENT=	Getopt(3) like library with a number of enhancements, from Redhat

LICENSE=	mit

OPTIONS_DEFINE=	NLS

CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE} \
		--program-prefix=""
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
GNU_CONFIGURE=	yes
USES=		libtool pathfix iconv
USE_LDCONFIG=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext
OPTIONS_SUB=	yes

.include <bsd.port.mk>
