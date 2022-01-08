PORTNAME=	smartmontools
DISTVERSION=	7.2
PORTREVISION=	0
CATEGORIES=	sysutils
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	S.M.A.R.T. disk monitoring tools

LICENSE=	gpl2

CONFLICTS=	smartmontools-devel-[0-9]*

USES=		compiler:c++11-lib cpe shebangfix
USE_RC_SUBR=	smartd

SHEBANG_FILES=	examplescripts/Example5
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-dependency-tracking \
		--enable-sample \
		--with-gnupg=no \
		--with-nvme-devicescan=yes \
		--with-initscriptdir=${PREFIX}/etc/rc.d
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
SUB_FILES=	pkg-message smart

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's| install-initdDATA| |' ${WRKSRC}/Makefile.in

post-install:
	@${MKDIR} ${PREFIX}/etc/periodic/daily
	${INSTALL_SCRIPT} ${WRKDIR}/smart \
		${PREFIX}/etc/periodic/daily
	${MV} ${DATADIR}/drivedb.h \
		${DATADIR}/drivedb.h.sample

.include <bsd.port.mk>
