PORTNAME=	smartmontools
DISTVERSION=	7.4
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	S.M.A.R.T. disk monitoring tools
WWW=		https://www.smartmontools.org

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	gpg-agent:security/gnupg

USES=		compiler:c++11-lib cpe shebangfix
USE_RC_SUBR=	smartd

SHEBANG_FILES=	examplescripts/Example5
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-dependency-tracking \
		--enable-sample \
		--with-gnupg=yes \
		--with-nvme-devicescan=yes \
		--with-initscriptdir=${PREFIX}/etc/rc.d
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4
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
