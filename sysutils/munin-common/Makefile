# $MidnightBSD$

PORTNAME=	munin
PORTVERSION=	${MUNIN_VERSION}
CATEGORIES=	sysutils perl5
MASTER_SITES=	${MUNIN_SITES}
PKGNAMESUFFIX=	-common

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common components between a munin node and server

LICENSE=	gpl2

BUILD_DEPENDS=	p5-Module-Build>=0:${PORTSDIR}/devel/p5-Module-Build \
		p5-Net-SSLeay>=0:${PORTSDIR}/security/p5-Net-SSLeay
RUN_DEPENDS=	p5-Net-SSLeay>=0:${PORTSDIR}/security/p5-Net-SSLeay

FAKE_OPTS=	prefixhack
USE_PERL5=	yes
USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:S/.r/rc/}

.include "${.CURDIR}/../munin-common/munin.mk"

ALL_TARGET=	build-common-prime
INSTALL_TARGET=	DATADIR=${FAKE_DESTDIR}/${DATADIR} install-common

MAN3=		Munin::Common::Config.3 \
		Munin::Common::Defaults.3 \
		Munin::Common::TLS.3 \
		Munin::Common::TLSClient.3 \
		Munin::Common::TLSServer.3 \
		Munin::Common::Timeout.3

post-install:
	@${MKDIR} ${LOGDIR} ${STATEDIR} ${SPOOLDIR}
	@${CHOWN} ${USERS}:${GROUPS} ${LOGDIR} ${STADEDIR} ${SPOOLDIR}
	@(cd ${WRKSRC}/common/blib/libdoc && for man in ${MAN3} ; do \
		${INSTALL_MAN} -C $$man ${PREFIX}/man/man3; \
	done)
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' ${FAKE_DESTDIR}${TRUE_PREFIX}/lib/perl5/site_perl/${PERL_VER}/Munin/Common/Defaults.pm

.include <bsd.port.mk>
