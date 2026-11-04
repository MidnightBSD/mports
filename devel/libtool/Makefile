# Created by: Motoyuki Kasahara <m-kasahr@sra.co.jp>


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

.include <bsd.port.mk>
