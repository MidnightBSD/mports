PORTNAME=	ebsnvme-id
DISTVERSION=	1.0.2
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Exposes information about NVMe disks on EC2
WWW=		https://github.com/cperciva/ebsnvme-id

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

USE_GITHUB=	YES
GH_ACCOUNT=	cperciva

USES=		uidfix

PLIST_FILES=	etc/rc.d/dev_aws_disk		\
		etc/devd/dev-aws-disk.conf	\
		sbin/ebsnvme-id			\
		man/man8/ebsnvme-id.8.gz

post-install:
	@${MKDIR} ${PREFIX}/etc/devd
	${INSTALL_DATA} ${WRKSRC}/dev-aws-disk.conf ${PREFIX}/etc/devd
	${INSTALL_SCRIPT} ${WRKSRC}/dev_aws_disk ${PREFIX}/etc/rc.d/

.include <bsd.port.mk>
