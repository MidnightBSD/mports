# New ports collection makefile for: openoffice2-linux
# Date created:		June 4 2008
# Whom:                 Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/editors/linux-openoffice2/Makefile,v 1.2 2008/06/04 14:35:28 laffer1 Exp $
#

PORTNAME=	openoffice2
PORTVERSION=	${OO_RELEASE}
PORTREVISION=	1
CATEGORIES=	editors java  linux 
MASTER_SITES=	${MASTER_SITE_OPENOFFICE:=stable/${OO_RELEASE}/}
PKGNAMEPREFIX?=	linux-
DISTNAME=		OOo_${OO_RELEASE}_LinuxIntel_install_en-US
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Integrated office productivity suite (binary pkg)
LICENSE=	lgpl

RUN_DEPENDS+=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

ONLY_FOR_ARCHS=	i386 amd64

USE_GCPIO=	yes
USE_LINUX=	yes
USE_XORG=	x11 ice xaw xau xext xrender xrandr \
		xi xt xcursor xdamage xcomposite xfixes 
NO_BUILD=	yes

OO_VER=			2.4
OO_RELEASE=		2.4.0

RPM2CPIO?=              ${LOCALBASE}/bin/rpm2cpio
BUILD_DEPENDS+=       ${RPM2CPIO}:${PORTSDIR}/archivers/rpm
RC_CMD?=           ${RPM2CPIO}
RC_AFTER_ARGS?=    | ${CPIO} -id --quiet

RPMFILES= \
	openoffice.org-base-2.4.0-9286.i586.rpm \
	openoffice.org-calc-2.4.0-9286.i586.rpm \
	openoffice.org-core01-2.4.0-9286.i586.rpm \
	openoffice.org-core02-2.4.0-9286.i586.rpm \
	openoffice.org-core03-2.4.0-9286.i586.rpm \
	openoffice.org-core03u-2.4.0-9286.i586.rpm \
	openoffice.org-core04-2.4.0-9286.i586.rpm \
	openoffice.org-core04u-2.4.0-9286.i586.rpm \
	openoffice.org-core05-2.4.0-9286.i586.rpm \
	openoffice.org-core05u-2.4.0-9286.i586.rpm \
	openoffice.org-core06-2.4.0-9286.i586.rpm \
	openoffice.org-core07-2.4.0-9286.i586.rpm \
	openoffice.org-core08-2.4.0-9286.i586.rpm \
	openoffice.org-core09-2.4.0-9286.i586.rpm \
	openoffice.org-core10-2.4.0-9286.i586.rpm \
	openoffice.org-draw-2.4.0-9286.i586.rpm \
	openoffice.org-emailmerge-2.4.0-9286.i586.rpm \
	openoffice.org-gnome-integration-2.4.0-9286.i586.rpm \
	openoffice.org-graphicfilter-2.4.0-9286.i586.rpm \
	openoffice.org-headless-2.4.0-9286.i586.rpm \
	openoffice.org-impress-2.4.0-9286.i586.rpm \
	openoffice.org-javafilter-2.4.0-9286.i586.rpm \
	openoffice.org-kde-integration-2.4.0-9286.i586.rpm \
	openoffice.org-math-2.4.0-9286.i586.rpm \
	openoffice.org-onlineupdate-2.4.0-9286.i586.rpm \
	openoffice.org-pyuno-2.4.0-9286.i586.rpm \
	openoffice.org-testtool-2.4.0-9286.i586.rpm \
	openoffice.org-writer-2.4.0-9286.i586.rpm \
	openoffice.org-xsltfilter-2.4.0-9286.i586.rpm

WRKSRC=			${WRKDIR}/OOH680_m12_native_packed-1_en-US.9286

OPTIONS=	JAVA "Enable Java Support" off

.include <bsd.port.pre.mk>

LINPROCFS!=	/sbin/mount | ${GREP} linprocfs | ${AWK} '{print $1}'

.if defined(WITH_JAVA)
USE_JAVA=	yes
JAVA_VERSION=	1.4 1.5
.endif

pre-fetch:
.if ${LINPROCFS}
	@${ECHO}
	@${ECHO} Check if linprocfs is running: YES
.else
	@${ECHO} Check if linprocfs is running: NO
	@${ECHO}
	@${ECHO} ERROR:
	@${ECHO}
	@${ECHO} OpenOffice.org setup needs a running linprocfs. it seems
	@${ECHO} that procfs is not mounted on your system.  Please
	@${ECHO} read the linprocfs\(5\) manpage and ensure the
	@${ECHO} the following line is in /etc/fstab, and that the
	@${ECHO} linprocfs file system is mounted:
	@${ECHO}
	@${ECHO} linproc /compat/linux/proc linprocfs rw 0 0
	@${ECHO}
	@${FALSE}
.endif
.if !exists(${LINUXBASE}/etc/mtab)
	@${ECHO}
	@${ECHO} ERROR:
	@${ECHO}
	@${ECHO} The file ${LINUXBASE}/etc/mtab is missing.
	@${ECHO} OpenOffice.org needs this file else some functions
	@${ECHO} are not working. You can create it with
	@${ECHO}
	@${ECHO} touch ${LINUXBASE}/etc/mtab
	@${ECHO}
	@${FALSE}
.else
	@${ECHO} Check if ${LINUXBASE}/etc/mtab exists: YES
.endif

pre-install:
	${MKDIR} ${WRKDIR}/oo

do-install:
	for fi in ${RPMFILES}; do \
	if !(cd ${WRKDIR}/oo && ${RC_CMD} ${WRKSRC}/RPMS/$$fi ${RC_AFTER_ARGS});\
		then \
			exit 1; \
		fi \
	done
	if [ `${ID} -u` = 0 ]; then \
		 ${CHMOD} -R ug-s ${WRKDIR}/oo; \
		${CHOWN} -R 0:0 ${WRKDIR}/oo; \
	fi
	${MV} ${WRKDIR}/oo/opt/openoffice.org2.4 ${PREFIX}

	${LN} -sf ${PREFIX}/openoffice.org${OO_VER}/program/soffice ${PREFIX}/bin/soffice
.for i in scalc sdraw simpress swriter
	${LN} -sf ${PREFIX}/openoffice.org${OO_VER}/program/${i} ${PREFIX}/bin/${i}
.endfor

.include <bsd.port.post.mk>
