# $MidnightBSD: mports/misc/chmlib/Makefile,v 1.1 2009/01/03 02:23:12 ctriv Exp $

PORTNAME=	chmlib
PORTVERSION=	0.40
CATEGORIES=	misc
MASTER_SITES=	http://www.jedrea.com/chmlib/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for dealing with Microsoft ITSS/CHM format files
LICENSE=	lgpl

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-io64 --disable-pread --exec-prefix=${PREFIX} --disable-static --enable-examples
USE_GMAKE=	yes
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e "s,-lpthread,${PTHREAD_LIBS}," ${WRKSRC}/configure

.include <bsd.port.mk>
