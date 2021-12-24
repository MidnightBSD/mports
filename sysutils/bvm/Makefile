# Created by: Qiang Guo <guoqiang_cn@126.com>

PORTNAME=	bvm
PORTVERSION=	1.3.2
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bhyve VM Manager

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	Bhyve VM Manager is required to be built on a 64bit machine

RUN_DEPENDS=	bhyve-firmware>0:sysutils/bhyve-firmware \
		grub-bhyve:sysutils/grub2-bhyve \
		tmux:sysutils/tmux

USE_GITHUB=	yes
GH_ACCOUNT=	bigdragonsoft

BUILD_WRKSRC=	${WRKSRC}/src

do-install:
	${MKDIR} ${PREFIX}/etc/bvm
	${INSTALL_DATA} ${WRKSRC}/conf/bvm.conf ${PREFIX}/etc/bvm/bvm.conf.sample
	${INSTALL_DATA} ${WRKSRC}/conf/nat.conf ${PREFIX}/etc/bvm/nat.conf.sample
	${INSTALL_DATA} ${WRKSRC}/conf/switch.conf ${PREFIX}/etc/bvm/switch.conf.sample
	${INSTALL_DATA} ${WRKSRC}/conf/dhcp.conf ${PREFIX}/etc/bvm/dhcp.conf.sample
	${INSTALL_SCRIPT} ${WRKSRC}/conf/bvmd ${PREFIX}/etc/rc.d/
	${INSTALL_PROGRAM} ${WRKSRC}/src/bvm ${PREFIX}/bin/
	${INSTALL_PROGRAM} ${WRKSRC}/src/bvmb ${PREFIX}/bin/
	${INSTALL_PROGRAM} ${WRKSRC}/src/bvmdhcp ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/bvm.8 ${MAN8PREFIX}/man/man8

.include <bsd.port.mk>
