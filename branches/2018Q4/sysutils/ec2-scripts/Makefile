# Created by: Colin Percival
# $FreeBSD: head/sysutils/ec2-scripts/Makefile 379591 2015-02-22 10:32:30Z cperciva $
# $MidnightBSD$

PORTNAME=	ec2-scripts
PORTVERSION=	1.10
CATEGORIES=	sysutils
MASTER_SITES=	http://freebsd-ec2-dist.s3.amazonaws.com/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Startup scripts for FreeBSD/EC2 environment

LICENSE=	bsd2

OPTIONS_DEFINE=	NOFIRSTBOOT
NOFIRSTBOOT_DESC=	Use old (pre-firstboot support) version of scripts

NO_BUILD=	YES

RC_SCRIPTS=	ec2_bootmail ec2_ephemeralswap ec2_fetchkey ec2_loghostkey

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNOFIRSTBOOT}
PORTVERSION=	1.5
PORTREVISION=	1
NO_INSTALL=	YES
RC_SCRIPTS+=	ec2_firstboot panicmail
.else
RC_SCRIPTS+=	ec2_configinit
PLIST_FILES=	sbin/configinit
.endif

.for i in ${RC_SCRIPTS}
PLIST_FILES+=	etc/rc.d/$i
.endfor

.if ! ${PORT_OPTIONS:MNOFIRSTBOOT}
do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/configinit.sh ${PREFIX}/sbin/configinit
.endif

post-install:
.for i in ${RC_SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/${i} ${PREFIX}/etc/rc.d/
.endfor

.include <bsd.port.mk>
