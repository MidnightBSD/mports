# $MidnightBSD$

PORTNAME=	libidn
PORTVERSION=	1.31
PORTREVISION=	0
CATEGORIES=	dns
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internationalized Domain Names command line tool

LICENSE=	gpl2 lgpl3
LICENSE_COMB=	dual

BUILD_DEPENDS+=	 help2man:${PORTSDIR}/misc/help2man \
		 automake:${PORTSDIR}/devel/automake

OPTIONS_DEFINE=	DOCS NLS

OPTIONS_SUB=yes

GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
USE_AUTOTOOLS=	automake:env
USES=		gmake iconv libtool makeinfo pathfix perl5 pkgconfig
USE_LDCONFIG=	yes
USE_PERL5=	build

INFO=		libidn

.include <bsd.mport.options.mk>

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext

post-patch:
	@${REINPLACE_CMD} -e '/^Libs.private:/s/$$/ @LTLIBINTL@/' \
		${WRKSRC}/libidn.pc.in
	${REINPLACE_CMD} -e 's/1.14/1.15/g' ${WRKSRC}/configure.ac

post-install:
	${MKDIR} ${DOCSDIR}
.for i in FAQ NEWS README
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
	${MV} ${PREFIX}/lib/pkgconfig/libidn.pc ${PREFIX}/libdata/pkgconfig/libidn.pc

.include <bsd.port.mk>
