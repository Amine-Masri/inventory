<?php

namespace App\DataFixtures;

use App\Entity\Role;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AppFixtures extends Fixture
{
    private $passwordHasher;
   
    public function __construct(UserPasswordHasherInterface  $passwordHasher)
    {
        $this->passwordHasher = $passwordHasher;
    }

    public function load(ObjectManager $manager)
    {
        $roles = [
            "ROLE_SUPERUSER" => "Super Admin",
            "ROLE_ADMINISTRATOR" => "Admin",
            "ROLE_TECH" => "Manager",
            "ROLE_CLIENT" => "User"
        ];

        foreach ($roles as $key => $value) {
            if (!$manager->getRepository(Role::class)->findByRoleName([$key])) {
                $role = new Role();
                $role->setRoleName($key);
                $manager->persist($role);
                $manager->flush();
            }
        }

        $user = new User();
        if (!$manager->find(User::class, 1)) {
            $user->setUsername('admin');
            $user->setRoles(["ROLE_SUPERUSER"]);
            $plainPassword ='admin';
            $user->setPassword($hashedPassword = $this->passwordHasher->hashPassword($user, $plainPassword));
            $user->setNomComplet('Admin');
            $user->setEmail('admin@example.com');
            $user->setValid(true);
            $user->setDeleted(false);
            $user->setAdmin(true);
            $manager->persist($user);
            $manager->flush();
        }
             /*if(!$manager->find(User::class, 2)){
            $user->setUsername('test');
            $user->setRoles(["ROLE_CLIENT"]);
            $plainPassword ='test';
            $user->setPassword($hashedPassword = $this->passwordHasher->hashPassword($user, $plainPassword));
            $user->setNomComplet('test');
            $user->setEmail('test@test.com');
            $user->setValid(true);
            $user->setDeleted(false);
            $user->setAdmin(false);
            $manager->persist($user);}
            $manager->flush();

        }*/
            
    } }
    
