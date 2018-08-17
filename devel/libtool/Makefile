# Created by: Motoyuki Kasahara <m-kasahr@sra.co.jp>
# $FreeBSD: head/devel/libtool/Makefile 370099 2014-10-05 18:01:19Z tijl $
# $MidnightBSD$

PORTNAME=	libtool
PORTREVISION=	3

COMMENT=	Generic shared library support script

.include "${.CURDIR}/../libtool/Makefile.common"

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	gm4:devel/m4
RUN_DEPENDS=	gm4:devel/m4

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-ltdl-install 
MAKE_ARGS=	MAKEINFOFLAGS=--no-split
USES+=		makeinfo

INFO=		libtool

post-patch:
	@${RM} -f ${WRKSRC}/doc/*.info*
.for f in build-aux/ltmain.sh configure m4/libtool.m4 m4/ltdl.m4  libltdl/configure
	@${TOUCH} -mr ${WRKSRC}/${f}.orig ${WRKSRC}/${f}
.endfor

.include <bsd.port.mk>
