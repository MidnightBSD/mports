PORTNAME=	ec2-scripts
PORTVERSION=	1.12
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Startup scripts for FreeBSD/EC2 environment
WWW=		https://www.daemonology.net/freebsd-on-ec2/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

RUN_DEPENDS=	${LOCALBASE}/sbin/ebsnvme-id:sysutils/ebsnvme-id \
		${LOCALBASE}/bin/aws-ec2-imdsv2-get:net/aws-ec2-imdsv2-get

USE_GITHUB=	YES
GH_ACCOUNT=	cperciva

NO_BUILD=	YES

RC_SCRIPTS=	ec2_bootmail \
		ec2_configinit \
		ec2_ephemeral_diskseen \
		ec2_ephemeral_swap \
		ec2_fetchkey \
		ec2_loghostkey
PLIST_FILES=	sbin/configinit

.for i in ${RC_SCRIPTS}
PLIST_FILES+=	etc/rc.d/$i
.endfor

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/configinit.sh ${PREFIX}/sbin/configinit

post-install:
.for i in ${RC_SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/${i} ${PREFIX}/etc/rc.d/
.endfor

.include <bsd.port.mk>
