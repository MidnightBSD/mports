PORTNAME=	libatomic_ops
DISTVERSION=	7.8.2
CATEGORIES=	devel
MASTER_SITES=	https://github.com/ivmai/libatomic_ops/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Atomic operations access library
WWW=		https://github.com/ivmai/libatomic_ops

LICENSE=	bsd2 gpl2
LICENSE_COMB=	multi

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		cpe libtool pathfix

OPTIONS_DEFINE=	DOCS

CPE_VENDOR=	libatomic_ops_project

.include <bsd.mport.options.mk>

post-patch:
# Inhibit installation of extra copy of GPL
	@${REINPLACE_CMD} -E 's,: (un)?install-dist_pkgdataDATA,:,' \
		${WRKSRC}/Makefile.in
.if ${PORT_OPTIONS:MDOCS}
# Fix documentation installation directory
	@${REINPLACE_CMD} -e 's,pkgdata,pkgdoc,g ; s,(datadir.*,(docdir),' \
		${WRKSRC}/Makefile.in
.else
# If documentation is not wanted, just disable it instead of fixing
	@${REINPLACE_CMD} -E 's,: (un)?install-dist_pkgdataDATA,:,' \
		${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
